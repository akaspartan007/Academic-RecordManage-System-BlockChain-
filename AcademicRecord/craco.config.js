const webpack = require('webpack');

module.exports = {
    webpack: {
        configure: (webpackConfig) => {
            webpackConfig.resolve = {
                ...webpackConfig.resolve,
                fallback: {
                    stream: require.resolve('stream-browserify'),
                    crypto: require.resolve('crypto-browserify'),
                    assert: require.resolve('assert/'),
                    https: require.resolve('https-browserify'),
                    http: require.resolve('stream-http'),
                    url: require.resolve('url/'),
                    os: require.resolve('os-browserify/browser'),
                    path: require.resolve('path-browserify'),
                    util: require.resolve('util/'),
                    constants: require.resolve('constants-browserify'),
                    zlib: require.resolve('browserify-zlib'),
                    textdecoder: require.resolve('text-encoding/lib/encoding'), // Added fallback
                },
            };

            webpackConfig.plugins = [
                ...webpackConfig.plugins,
                new webpack.ProvidePlugin({
                    Buffer: ['buffer', 'Buffer'], // Polyfill for Buffer
                    process: 'process/browser',  // Polyfill for process
                }),
            ];

            return webpackConfig;
        },
    },
};
