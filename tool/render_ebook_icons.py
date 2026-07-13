#!/usr/bin/env python3
"""Render Sotong Ebook Promo brand icons from SVG to PNG."""

from __future__ import annotations

import io
from pathlib import Path

import cairosvg
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
ICONS = ROOT / "web" / "icons"
BRANDING = ROOT / "assets" / "branding"
FAVICON = ROOT / "web" / "favicon.png"

SRC = ICONS / "sotong_ebook_icon.svg"
MASKABLE = ICONS / "sotong_ebook_icon_maskable.svg"


def render_svg(svg_path: Path, size: int) -> Image.Image:
    png_bytes = cairosvg.svg2png(
        url=str(svg_path),
        output_width=size,
        output_height=size,
    )
    return Image.open(io.BytesIO(png_bytes)).convert("RGBA")


def save_png(image: Image.Image, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    image.save(path, format="PNG", optimize=True)
    print(f"Wrote {path.relative_to(ROOT)} ({image.size[0]}x{image.size[1]}, {path.stat().st_size} bytes)")


def main() -> None:
    if not SRC.exists():
        raise SystemExit(f"Missing source SVG: {SRC}")
    if not MASKABLE.exists():
        raise SystemExit(f"Missing maskable SVG: {MASKABLE}")

    BRANDING.mkdir(parents=True, exist_ok=True)
    branding_copy = BRANDING / "sotong_ebook_icon.svg"
    branding_copy.write_bytes(SRC.read_bytes())
    print(f"Copied branding SVG -> {branding_copy.relative_to(ROOT)}")

    outputs = [
        (SRC, 512, ICONS / "Icon-512.png"),
        (SRC, 192, ICONS / "Icon-192.png"),
        (SRC, 48, FAVICON),
        (MASKABLE, 512, ICONS / "Icon-maskable-512.png"),
        (MASKABLE, 192, ICONS / "Icon-maskable-192.png"),
    ]

    for svg, size, out in outputs:
        img = render_svg(svg, size)
        if img.size != (size, size):
            img = img.resize((size, size), Image.Resampling.LANCZOS)
        save_png(img, out)

    print("Icon render complete.")


if __name__ == "__main__":
    main()
