import { defineConfig } from "vite"

export default defineConfig({
  build: {
    rollupOptions: {
      input: "script/motoko.js",
      output: {
        manualChunks: false,
        dir: "theme",
        entryFileNames: "motoko.js",
        inlineDynamicImports: true,
      }
    },
    emptyOutDir: false,
  },
})
