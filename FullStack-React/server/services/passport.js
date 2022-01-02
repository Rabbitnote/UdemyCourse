const passport = require('passport');
const key = require('../config/key');
const GoogleStartegy = require('passport-google-oauth20').Strategy;
passport.use(
    new GoogleStartegy(
        {
            clientID: key.googleClientID,
            clientSecret: key.googleClientSecert,
            callbackURL: '/auth/google/callback',
        },
        //To take information from google to create user in our Database
        (accessToken, refreshToken, profile, done) => {
            console.log('Access token', accessToken);
            console.log('Refresh token', refreshToken);
            console.log('Profile:', profile);
        }
    )
);