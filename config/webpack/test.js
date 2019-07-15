process.env.NODE_ENV = process.env.NODE_ENV || "development";

const environment = require("./environment");

const environment = require('./environment');

module.exports = Object.assign({}, environment.toWebpackConfig(), {
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  }
});
