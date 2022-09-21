/* eslint-disable no-param-reassign */

const webpack = require('webpack');
const dotenv = require('dotenv');

const env = dotenv.config().parsed;
const envKeys = Object.keys(env).reduce((prev, next) => {
  prev[`process.env.${next}`] = JSON.stringify(env[next]);
  return prev;
}, {});
const envKeysPlugin = new webpack.DefinePlugin(envKeys);

module.exports = envKeysPlugin;
