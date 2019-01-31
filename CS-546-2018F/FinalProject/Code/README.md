# Base Root for all Codes

Data folder is moved to ./server/data for clearer purpose. Note that the bundle.js is also uploaded now. Thus, people can use just npm install and npm start to test the website. The server router will start both itself and the client router for easier debugging (Location: ./server/routes/index.js), but they can be seperated easily.

## Commands for Test

Install Environment:  
npm install

Start server/index.js (our main):  
npm start  

(Optional) Seed Databse (Note that you can use website to seed database yourslef):  
npm run seed  
**Important Note**:  
The mocked username/real_password and bookTitle/ISBN are printed in console for testing only. Else all passwords are stored as hashed and can't be tested in login.

## For Development

Use nodemon:  
npm run server-dev  

Use webpack and install bundle.js:  
npm run react-dev  

(optional) Use --optimize-minimize and --define process.env.NODE_ENV="'production'":  
npm run build  

For development, it's easier to use both nodemon and webpack.