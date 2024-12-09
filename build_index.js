import pug from 'pug'
import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

// Get the directory name of the current module
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

// read versions from package.json
const { versions } = JSON.parse(fs.readFileSync('./package.json'))

const html = pug.renderFile('index.html.pug', { versions })

const distDir = path.join(__dirname, 'dist')
if (!fs.existsSync(distDir)) {
  fs.mkdirSync(distDir)
}

fs.writeFileSync(path.join(distDir, 'index.html'), html)

