import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
    plugins: [vue()],
    server: {
        port: 3331,   // Vite dev server port
        https: false, // or true if you want https
        proxy: {
            '/': {
                target: 'http://localhost:8000',
                changeOrigin: true,
                secure: false,
            }
        }
    }
});
