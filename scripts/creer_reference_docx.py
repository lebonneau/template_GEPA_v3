#!/usr/bin/env python3
"""Construit le document de styles utilisé par Pandoc pour l'export GÉPA."""

import subprocess

from docx import Document
from docx.enum.section import WD_SECTION
from docx.enum.style import WD_STYLE_TYPE
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_LINE_SPACING
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
from docx.shared import Cm, Pt, RGBColor


def set_font(style, size, *, italic=False, bold=False):
    style.font.name = "Times New Roman"
    style.font.size = Pt(size)
    style.font.italic = italic
    style.font.bold = bold
    style.font.color.rgb = RGBColor(0, 0, 0)
    rpr = style.element.get_or_add_rPr()
    rfonts = rpr.rFonts
    if rfonts is None:
        rfonts = OxmlElement("w:rFonts")
        rpr.insert(0, rfonts)
    for attr in ("ascii", "hAnsi", "eastAsia", "cs"):
        rfonts.set(qn(f"w:{attr}"), "Times New Roman")


def set_outline(style, level):
    ppr = style.element.get_or_add_pPr()
    outline = ppr.find(qn("w:outlineLvl"))
    if outline is None:
        outline = OxmlElement("w:outlineLvl")
        ppr.append(outline)
    outline.set(qn("w:val"), str(level))


def get_style(doc, name):
    for style in doc.styles:
        if style.name == name:
            return style
    raise KeyError(name)


def ensure_style(doc, name, base="Normal"):
    for style in doc.styles:
        if style.name == name:
            return style
    style = doc.styles.add_style(name, WD_STYLE_TYPE.PARAGRAPH)
    style.base_style = get_style(doc, base)
    return style


with open("reference-gepa.docx", "wb") as stream:
    subprocess.run(
        ["pandoc", "--print-default-data-file", "reference.docx"],
        check=True,
        stdout=stream,
    )

doc = Document("reference-gepa.docx")
section = doc.sections[0]
section.page_width = Cm(21.59)
section.page_height = Cm(27.94)
section.top_margin = Cm(2.5)
section.bottom_margin = Cm(2.5)
section.left_margin = Cm(2.5)
section.right_margin = Cm(2.5)
section.header_distance = Cm(1.5)
section.footer_distance = Cm(1.5)
section.start_type = WD_SECTION.NEW_PAGE

normal = get_style(doc, "Normal")
set_font(normal, 12)
normal.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
normal.paragraph_format.first_line_indent = Cm(0)
normal.paragraph_format.left_indent = Cm(0)
normal.paragraph_format.right_indent = Cm(0)
normal.paragraph_format.line_spacing_rule = WD_LINE_SPACING.ONE_POINT_FIVE
normal.paragraph_format.space_after = Pt(9)
normal.paragraph_format.widow_control = True

for index, style_name in enumerate(("Heading 1", "Heading 2", "Heading 3")):
    style = get_style(doc, style_name)
    set_font(style, 12, bold=True)
    style.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.LEFT
    style.paragraph_format.line_spacing_rule = WD_LINE_SPACING.ONE_POINT_FIVE
    style.paragraph_format.space_before = Pt(18 if index == 0 else 12)
    style.paragraph_format.space_after = Pt(6)
    style.paragraph_format.keep_with_next = True
    set_outline(style, index)

body_text = ensure_style(doc, "Body Text")
set_font(body_text, 12)
body_text.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
body_text.paragraph_format.line_spacing_rule = WD_LINE_SPACING.ONE_POINT_FIVE
body_text.paragraph_format.first_line_indent = Cm(0)
body_text.paragraph_format.space_after = Pt(9)

compact = ensure_style(doc, "Compact")
set_font(compact, 12)
compact.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.LEFT
compact.paragraph_format.line_spacing_rule = WD_LINE_SPACING.SINGLE
compact.paragraph_format.space_after = Pt(0)

block = ensure_style(doc, "Block Text")
set_font(block, 12)
block.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
block.paragraph_format.left_indent = Cm(2.5)
block.paragraph_format.right_indent = Cm(2.5)
block.paragraph_format.first_line_indent = Cm(0)
block.paragraph_format.line_spacing_rule = WD_LINE_SPACING.SINGLE
block.paragraph_format.space_before = Pt(6)
block.paragraph_format.space_after = Pt(6)

footnote = ensure_style(doc, "Footnote Text")
set_font(footnote, 10)
footnote.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.LEFT
footnote.paragraph_format.line_spacing_rule = WD_LINE_SPACING.SINGLE
footnote.paragraph_format.first_line_indent = Cm(0)
footnote.paragraph_format.space_after = Pt(0)

bibliography = ensure_style(doc, "Bibliography")
set_font(bibliography, 12)
bibliography.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.LEFT
bibliography.paragraph_format.line_spacing_rule = WD_LINE_SPACING.SINGLE
bibliography.paragraph_format.first_line_indent = Cm(-1.25)
bibliography.paragraph_format.left_indent = Cm(1.25)
bibliography.paragraph_format.space_after = Pt(6)

style_specs = {
    "GEPA Institution": (False, False, 0, 0),
    "GEPA Titre": (True, False, 76, 0),
    "GEPA Sous-titre": (True, False, 0, 0),
    "GEPA Auteur": (False, False, 76, 0),
    "GEPA Destinataire": (False, False, 70, 0),
    "GEPA Cours": (False, False, 0, 0),
    "GEPA Lieu": (False, False, 78, 0),
    "GEPA Date": (False, False, 0, 0),
}
for name, (italic, bold, before, after) in style_specs.items():
    style = ensure_style(doc, name)
    set_font(style, 12, italic=italic, bold=bold)
    style.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.CENTER
    style.paragraph_format.line_spacing_rule = WD_LINE_SPACING.SINGLE
    style.paragraph_format.space_before = Pt(before)
    style.paragraph_format.space_after = Pt(after)
    style.paragraph_format.first_line_indent = Cm(0)

caption = get_style(doc, "Caption")
set_font(caption, 12, bold=False)
caption.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.LEFT
caption.paragraph_format.line_spacing_rule = WD_LINE_SPACING.SINGLE
caption.paragraph_format.space_before = Pt(6)
caption.paragraph_format.space_after = Pt(4)

doc.core_properties.title = "Référence de styles GÉPA v3"
doc.core_properties.subject = "Style Pandoc conforme au GÉPA v3"
doc.core_properties.author = "Lé Bonneau"

doc.save("reference-gepa.docx")
