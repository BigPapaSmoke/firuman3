import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import path from 'path';
import { fileURLToPath } from 'url';

const projectRoot = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig({
    base: './',

    resolve: {
        alias: [
            {
                find: '&',
                replacement: path.resolve(projectRoot, 'resources'),
            },
            {
                find: '~',
                replacement: path.resolve(projectRoot, 'resources/ts'),
            },
        ],
    },

    plugins: [
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),

        laravel({
            input: [
                'resources/ts/bootstrap.ts',
                'resources/ts/app.ts',
                'resources/ts/auth.ts',
                'resources/ts/pos.ts',
                'resources/ts/pos-init.ts',
                'resources/ts/setup.ts',
                'resources/ts/update.ts',
                'resources/ts/dashboard.ts',
                'resources/ts/widgets.ts',
                'resources/ts/popups.ts',
                'resources/ts/cashier.ts',
                'resources/ts/lang-loader.ts',

                'resources/scss/line-awesome/1.3.0/scss/line-awesome.scss',
                'resources/scss/app.scss',
                'resources/scss/light.scss',
                'resources/scss/dark.scss',
                'resources/scss/grid.scss',
                'resources/scss/animations.scss',
                'resources/scss/typography.scss',
                'resources/scss/fonts.scss',
            ],
            refresh: false,
        }),
    ],
});
