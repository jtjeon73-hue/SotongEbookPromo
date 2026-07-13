const fs = require('fs');
const path = require('path');
const { Resvg } = require('@resvg/resvg-js');

const root = process.cwd();
const iconsDir = path.join(root, 'web', 'icons');
const brandingDir = path.join(root, 'assets', 'branding');
const srcSvg = path.join(iconsDir, 'sotong_ebook_icon.svg');
const maskableSvgPath = path.join(iconsDir, 'sotong_ebook_icon_maskable.svg');

fs.mkdirSync(brandingDir, { recursive: true });
fs.copyFileSync(srcSvg, path.join(brandingDir, 'sotong_ebook_icon.svg'));

const baseSvg = fs.readFileSync(srcSvg, 'utf8');
const maskableSvg = fs.readFileSync(maskableSvgPath, 'utf8');

function renderPng(svgText, size, outPath) {
  const resvg = new Resvg(svgText, {
    fitTo: { mode: 'width', value: size },
    background: 'rgba(0,0,0,0)',
  });
  const pngData = resvg.render().asPng();
  fs.writeFileSync(outPath, pngData);
  console.log(`Wrote ${path.relative(root, outPath)} (${size}x${size}, ${pngData.length} bytes)`);
  return pngData.length;
}

const outputs = [
  { svg: baseSvg, size: 512, file: path.join(iconsDir, 'Icon-512.png') },
  { svg: baseSvg, size: 192, file: path.join(iconsDir, 'Icon-192.png') },
  { svg: baseSvg, size: 48, file: path.join(root, 'web', 'favicon.png') },
  { svg: maskableSvg, size: 512, file: path.join(iconsDir, 'Icon-maskable-512.png') },
  { svg: maskableSvg, size: 192, file: path.join(iconsDir, 'Icon-maskable-192.png') },
];

for (const item of outputs) {
  renderPng(item.svg, item.size, item.file);
}

console.log('Icon render complete.');
