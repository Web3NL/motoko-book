import { defineConfig } from "vite"

export default defineConfig({
  build: {
    lib: {
      entry: "script/motoko.js",
      name: "motoko-book",
      fileName: "motoko",
      formats: ["es"],
    },
    outDir: "theme",
    emptyOutDir: false,
  },
})
