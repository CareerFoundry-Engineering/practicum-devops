const HtmlWebPackPlugin = require('html-webpack-plugin');

const htmlPlugin = new HtmlWebPackPlugin({
  template: './src/index.html',
  filename: './index.html',
  inject: 'body',
  scriptLoading: 'module',
});

const path = require('path');
const envKeysPlugin = require('./src/plugins/envKeysPlugin');

module.exports = {
  mode: process.env.NODE_ENV || 'development',
  entry: path.resolve(__dirname, 'src', 'index.jsx'),
  output: {
    path: path.resolve(__dirname, './dist'),
    filename: './bundle.js',
  },
  module: {
    rules: [{
      test: /\.jsx$/i,
      include: path.resolve(__dirname, 'src'),
      exclude: /node_modules/,
      use: {
        loader: 'babel-loader',
      },
    }, {
      test: /\.css$/i,
      include: path.resolve(__dirname, 'src'),
      use: ['style-loader', 'css-loader', 'postcss-loader'],
    }],
  },
  devServer: {
    historyApiFallback: true,
    liveReload: true,
  },
  resolve: {
    extensions: ['.js', '.jsx'],
    alias: {
      Components: path.resolve(__dirname, 'src/components'),
      Pages: path.resolve(__dirname, 'src/pages'),
      Data: path.resolve(__dirname, 'src/data'),
    },
  },
  plugins: [htmlPlugin, envKeysPlugin],
};
