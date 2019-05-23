const { environment } = require("@rails/webpacker");
const eslint =  require('./loaders/eslint')

environment.loaders.append("vue", vue)
module.exports = environment;
