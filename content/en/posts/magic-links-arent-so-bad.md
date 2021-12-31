+++ 
draft = false
date = "2020-05-28"
title = "Magic links aren’t so bad"
description = ""
slug = ""
authors = ["Conor Mc Govern"]
tags = ["authentication", "CompSoc", "IDP", "JWT", "NodeJS", "passport"]
categories = ["CompSoc", "HowTo"]
externalLink = ""
series = []
translationKey = "magic-links-arent-so-bad"
+++

The last few days I've been thinking about magic links. It seems like they are used a lot on websites to confirm your email but I haven't seen many being used as sign-in solutions. I wanted to have a go at them as I haven't seen much documentation on them (I'm sure you can see a reoccurring theme here: I seem to like software that doesn't have an documentation), they seem to be used by IDPs like Auth0 a lot but not by websites that handle their own authentication. I'll try and go over my solution here. Beware, this is probably not the best/secure solution; this is just want came to mind as I've been coding the past few days.

I've always liked PassportJS, it handles authentication in a way that I understand and has some neat features. I also find JSON web tokens fascinating. Why not integrate the two and make some cool magic links?

Lets start off with a user coming to our website with the intention of signing in with an existing account. All they have to do is supply their student ID. We take that student ID, embed it in a JWT and shoot them off an email with a link that contains the token. They click this link, it authorizes them to get another JWT that is saved as a cookie and this then authorizes them to access our website authorized.

Lets start off by sending them a link.

    loginPost: async (req, res, next) => { if (req.body.id) { var token = jwt.sign({ id: req.body.id }, conf.jwtsecret, { expiresIn: '15m' }); var user = await ldapController.getMember(req.body.id); // Sending email with token mailController.sendTokenMail(token, user); return res.status(200).send({message: "check email"}); } else { return res.status(400).send({error: "No ID Provided"}); } }

They make a post to our authentication route, we take the ID they've given, embed it into a token and shoot them off an email containing a link such as: https://website.com/auth/login/jsontoken.

Now they come back to us after they click that link.

    jwt.verify(req.params.id, conf.jwtsecret, function (err, decoded) { if (err) return res.status(401).send({error: err}); var token = jwt.sign({ id: decoded.id, }, conf.jwtsecret); // Pushing token to array so it can't be used again tokens.push(req.params.id); // Logging in and giving new cookie that expires after a month instead of 15 mins req.login(ldapController.getMember(decoded.id), {session: false}, (err) => { if (err) return res.status(403).json({message: 'Unsuccessful Login!'}); res.cookie('jwt', token, { maxAge: 1000 * 60 * 60 * 24 * 30 }); res.redirect('/'); }) });

We know that it's them because they have that link. We got ahead and add that token to an array that's flushed every time that NodeJS stops, this isn't really an issue as the links are only active for 15 minutes anyways. We verify that the token is in-fact correct and make a new token that will last for a month and save it as a cookie.

Now every time that they come back to our site, we can take that cookie and authorize them with the below passport strategy. All it is doing is taking in the token, verifying it, grabbing the user data with respect to the user ID embedded in the token and returning it to be used on any of our pages.

    // jwtPayload is the JWT cookie received from the browser passport.use(new JWTStrategy(opts, async function (jwtPayload, done) { var user = await ldapController.getMember(jwtPayload.id); if (!user) done(null, false, {message: 'User Not Associated With Account'}); return done(null, user); } ));

Please do take all of this with a grain of salt and I am still learning. Having said that, I hope it does help give some people an insight into how this type of authentication can work. Even though my solution might be a bit rough around the edges.

That's it from me!  
Slán go foil.