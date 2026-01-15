import SwiftDocX
import Foundation

print("=== SwiftDocX Comprehensive Sample ===\n")

let outputDir = FileManager.default.currentDirectoryPath
let outputPath = URL(fileURLWithPath: outputDir).appendingPathComponent("sample_output.docx")

// MARK: - Create Document

print("Creating comprehensive sample document...")

let doc = Document()

// MARK: - Document Properties (Metadata/Accessibility)

doc.properties = DocumentProperties(
    title: "SwiftDocX Feature Showcase",
    subject: "Comprehensive demonstration of all library features",
    author: "SwiftDocX Library",
    keywords: "swift, docx, word, document, sample",
    description: "A complete sample showing every SwiftDocX capability",
    language: "en-US"
)

// MARK: - Header & Footer

let header = doc.createHeader()
let headerParagraph = Paragraph()
headerParagraph.alignment = .center
headerParagraph.addRun(Run(
    text: "SwiftDocX Feature Showcase",
    formatting: TextFormatting(bold: true, italic: true, font: .helvetica, color: .gray, fontSize: 10)
))
header.paragraphs.append(headerParagraph)

doc.setFooterWithPageNumbersAndTotal(alignment: .center)

// MARK: - Title Section

let titlePara = doc.addParagraph()
titlePara.alignment = .center
titlePara.spacing = ParagraphSpacing(before: 0, after: 24, lineSpacing: 1.0)
titlePara.addRun(Run(
    text: "SwiftDocX Feature Showcase",
    formatting: TextFormatting(bold: true, font: .arial, color: Color(hex: "2E86AB"), fontSize: 28)
))

let subtitlePara = doc.addParagraph()
subtitlePara.alignment = .center
subtitlePara.spacing = ParagraphSpacing(before: 0, after: 36, lineSpacing: 1.0)
subtitlePara.addRun(Run(
    text: "A Complete Demonstration of All Library Capabilities",
    formatting: TextFormatting(italic: true, font: .arial, color: .gray, fontSize: 14)
))

// MARK: - 1. Headings (H1-H6)

doc.addHeading1("1. Heading Styles")
doc.addParagraph("SwiftDocX supports all six heading levels:")
doc.addParagraph()

doc.addHeading1("Heading Level 1 (H1)")
doc.addHeading2("Heading Level 2 (H2)")
doc.addHeading3("Heading Level 3 (H3)")
doc.addHeading("Heading Level 4 (H4)", level: .heading4)
doc.addHeading("Heading Level 5 (H5)", level: .heading5)
doc.addHeading("Heading Level 6 (H6)", level: .heading6)
doc.addParagraph()

// MARK: - 2. Text Formatting

doc.addHeading1("2. Text Formatting")

// Basic styles
doc.addHeading2("Basic Styles")

let basicStylesPara = doc.addParagraph()
basicStylesPara.spacing = ParagraphSpacing(before: 6, after: 12, lineSpacing: 1.5)
basicStylesPara.addRun(Run(text: "Bold text", formatting: TextFormatting(bold: true)))
basicStylesPara.addRun(Run(text: " | "))
basicStylesPara.addRun(Run(text: "Italic text", formatting: TextFormatting(italic: true)))
basicStylesPara.addRun(Run(text: " | "))
basicStylesPara.addRun(Run(text: "Bold & Italic", formatting: TextFormatting(bold: true, italic: true)))
basicStylesPara.addRun(Run(text: " | "))
basicStylesPara.addRun(Run(text: "Strikethrough", formatting: TextFormatting(strikethrough: true)))

// Underline styles
doc.addHeading2("Underline Styles")

let underlineStyles: [(String, UnderlineStyle)] = [
    ("Single", .single),
    ("Double", .double),
    ("Thick", .thick),
    ("Dotted", .dotted),
    ("Dashed", .dash),
    ("Wave", .wave),
    ("DotDash", .dotDash)
]

let underlinePara = doc.addParagraph()
for (index, (name, style)) in underlineStyles.enumerated() {
    underlinePara.addRun(Run(text: name, formatting: TextFormatting(underline: style)))
    if index < underlineStyles.count - 1 {
        underlinePara.addRun(Run(text: " | "))
    }
}

// Colors
doc.addHeading2("Text Colors")

let colorPara = doc.addParagraph()
let colors: [(String, Color)] = [
    ("Red", .red),
    ("Green", .green),
    ("Blue", .blue),
    ("Orange", .orange),
    ("Purple", .purple),
    ("Custom Hex", Color(hex: "E91E63")!)
]

for (index, (name, color)) in colors.enumerated() {
    colorPara.addRun(Run(text: name, formatting: TextFormatting(bold: true, color: color, fontSize: 14)))
    if index < colors.count - 1 {
        colorPara.addRun(Run(text: " | "))
    }
}

// Highlight colors
doc.addHeading2("Highlight Colors")

let highlightPara = doc.addParagraph()
let highlights: [(String, HighlightColor)] = [
    ("Yellow", .yellow),
    ("Green", .green),
    ("Cyan", .cyan),
    ("Magenta", .magenta),
    ("Blue", .blue),
    ("Red", .red)
]

for (index, (name, highlight)) in highlights.enumerated() {
    highlightPara.addRun(Run(text: " \(name) ", formatting: TextFormatting(highlight: highlight)))
    if index < highlights.count - 1 {
        highlightPara.addRun(Run(text: " "))
    }
}

// Fonts
doc.addHeading2("Font Families")

let fonts: [(String, Font)] = [
    ("Arial", .arial),
    ("Times New Roman", .timesNewRoman),
    ("Calibri", .calibri),
    ("Helvetica", .helvetica),
    ("Georgia", .georgia),
    ("Verdana", .verdana),
    ("Courier New", .courierNew)
]

for (name, font) in fonts {
    doc.addParagraph("\(name): The quick brown fox jumps over the lazy dog.",
                     formatting: TextFormatting(font: font, fontSize: 12))
}

// Font sizes
doc.addHeading2("Font Sizes")

let sizePara = doc.addParagraph()
for size in [8, 10, 12, 14, 18, 24, 36] {
    sizePara.addRun(Run(text: "\(size)pt ", formatting: TextFormatting(fontSize: Double(size))))
}

// Special text effects
doc.addHeading2("Special Text Effects")

let effectsPara = doc.addParagraph()
effectsPara.addRun(Run(text: "Normal text with "))
effectsPara.addRun(Run(text: "superscript", formatting: TextFormatting(superscript: true)))
effectsPara.addRun(Run(text: " and "))
effectsPara.addRun(Run(text: "subscript", formatting: TextFormatting(subscriptText: true)))
effectsPara.addRun(Run(text: " | "))
effectsPara.addRun(Run(text: "ALL CAPS", formatting: TextFormatting(allCaps: true)))
effectsPara.addRun(Run(text: " | "))
effectsPara.addRun(Run(text: "Small Caps", formatting: TextFormatting(smallCaps: true)))

doc.addParagraph()

// MARK: - 3. Paragraph Formatting

doc.addHeading1("3. Paragraph Formatting")

// Alignment
doc.addHeading2("Text Alignment")

let leftPara = doc.addParagraph("Left aligned paragraph - This is the default alignment for most text.")
leftPara.alignment = .left
leftPara.spacing = ParagraphSpacing(before: 6, after: 6, lineSpacing: 1.0)

let centerPara = doc.addParagraph("Center aligned paragraph - Often used for titles and headings.")
centerPara.alignment = .center
centerPara.spacing = ParagraphSpacing(before: 6, after: 6, lineSpacing: 1.0)

let rightPara = doc.addParagraph("Right aligned paragraph - Useful for dates and signatures.")
rightPara.alignment = .right
rightPara.spacing = ParagraphSpacing(before: 6, after: 6, lineSpacing: 1.0)

let justifiedPara = doc.addParagraph("Justified paragraph - Text is spread evenly across the line width, creating clean edges on both sides. This is commonly used in books and formal documents for a polished appearance.")
justifiedPara.alignment = .both
justifiedPara.spacing = ParagraphSpacing(before: 6, after: 6, lineSpacing: 1.0)

// Indentation
doc.addHeading2("Indentation")

let indentedPara = doc.addParagraph("This paragraph has left indentation of 36 points (0.5 inch).")
indentedPara.indentation = ParagraphIndentation(left: 36, right: 0, firstLine: 0)

let firstLinePara = doc.addParagraph("This paragraph has a first-line indent of 36 points. The first line is indented more than the rest of the paragraph, which is a common style in books and formal documents.")
firstLinePara.indentation = ParagraphIndentation(left: 0, right: 0, firstLine: 36)

let hangingPara = doc.addParagraph("This paragraph has a hanging indent. The first line starts at the margin, while subsequent lines are indented. This style is commonly used for bibliographies and reference lists.")
hangingPara.indentation = ParagraphIndentation(left: 36, right: 0, firstLine: -36)

doc.addParagraph()

// MARK: - 4. Lists

doc.addHeading1("4. Lists")

// Bullet lists
doc.addHeading2("Bullet Lists")

doc.addBulletList([
    "First bullet item",
    "Second bullet item",
    "Third bullet item"
])

doc.addParagraph("Nested bullet list:")
doc.addBulletItem("Level 0 item", level: 0)
doc.addBulletItem("Level 1 nested item", level: 1)
doc.addBulletItem("Level 2 deeply nested item", level: 2)
doc.addBulletItem("Another level 1 item", level: 1)
doc.addBulletItem("Back to level 0", level: 0)

// Numbered lists
doc.addHeading2("Numbered Lists")

doc.addNumberedList([
    "First numbered item",
    "Second numbered item",
    "Third numbered item"
])

doc.addParagraph("Nested numbered list:")
doc.addNumberedItem("Level 0 item", level: 0)
doc.addNumberedItem("Level 1 nested item (a, b, c...)", level: 1)
doc.addNumberedItem("Level 2 nested item (i, ii, iii...)", level: 2)
doc.addNumberedItem("Another level 1 item", level: 1)
doc.addNumberedItem("Back to level 0", level: 0)

doc.addParagraph()

// MARK: - 5. Tables

doc.addHeading1("5. Tables")

// Basic table
doc.addHeading2("Basic Table")

let basicTableData = [
    ["Header 1", "Header 2", "Header 3"],
    ["Row 1, Cell 1", "Row 1, Cell 2", "Row 1, Cell 3"],
    ["Row 2, Cell 1", "Row 2, Cell 2", "Row 2, Cell 3"],
    ["Row 3, Cell 1", "Row 3, Cell 2", "Row 3, Cell 3"]
]
doc.addTable(from: basicTableData, hasHeader: true)

doc.addParagraph()

// Styled table
doc.addHeading2("Styled Table with Borders and Colors")

let styledTable = Table(rows: 4, columns: 3)
styledTable.borders = TableBorders.all(Border(style: .single, width: 1, color: .black))

// Header row
styledTable.rows[0].isHeader = true
let headers = ["Product", "Quantity", "Price"]
for (index, headerText) in headers.enumerated() {
    let cell = styledTable.cell(at: 0, column: index)
    cell?.paragraphs.removeAll()
    cell?.addParagraph(headerText, formatting: TextFormatting(bold: true))
    cell?.backgroundColor = Color(hex: "2E86AB")
    cell?.verticalAlignment = .center
}

// Data rows with alternating colors
let tableData = [
    ["Widget A", "100", "$9.99"],
    ["Widget B", "250", "$14.99"],
    ["Widget C", "75", "$24.99"]
]

for (rowIndex, rowData) in tableData.enumerated() {
    let actualRow = rowIndex + 1
    for (colIndex, cellText) in rowData.enumerated() {
        let cell = styledTable.cell(at: actualRow, column: colIndex)
        cell?.paragraphs.removeAll()
        cell?.addParagraph(cellText)
        if rowIndex % 2 == 0 {
            cell?.backgroundColor = Color(hex: "F0F0F0")
        }
    }
}

styledTable.accessibilityCaption = "Product Inventory Table"
styledTable.accessibilitySummary = "A table showing product names, quantities, and prices"

doc.addTable(styledTable)

doc.addParagraph()

// Table with cell spanning
doc.addHeading2("Table with Merged Cells")

let spanTable = Table(rows: 3, columns: 3)
spanTable.borders = TableBorders.all(Border.single)

let mergedCell = spanTable.cell(at: 0, column: 0)
mergedCell?.paragraphs.removeAll()
mergedCell?.addParagraph("Merged Header Cell (spans 3 columns)", formatting: TextFormatting(bold: true))
mergedCell?.columnSpan = 3
mergedCell?.backgroundColor = Color(hex: "4CAF50")

spanTable.setText("Cell 1", at: 1, column: 0)
spanTable.setText("Cell 2", at: 1, column: 1)
spanTable.setText("Cell 3", at: 1, column: 2)

spanTable.setText("Cell 4", at: 2, column: 0)
spanTable.setText("Cell 5", at: 2, column: 1)
spanTable.setText("Cell 6", at: 2, column: 2)

doc.addTable(spanTable)

doc.addParagraph()

// MARK: - 6. Hyperlinks

doc.addHeading1("6. Hyperlinks")

doc.addHyperlink(
    url: "https://github.com/",
    text: "Visit GitHub",
    tooltip: "Click to open GitHub"
)

let linkPara = doc.addParagraph()
linkPara.addRun(Run(text: "For more information, please visit "))
linkPara.addHyperlink(url: "https://swift.org", text: "the Swift website", tooltip: "Swift Programming Language")
linkPara.addRun(Run(text: " for documentation."))

doc.addParagraph()

// MARK: - Page Break

doc.addPageBreak()

// MARK: - 7. Images

doc.addHeading1("7. Images")

doc.addParagraph("SwiftDocX supports embedding images with the following features:")

doc.addBulletList([
    "Multiple formats: PNG, JPEG, GIF, BMP, TIFF",
    "Custom width and height (in points)",
    "Alt text for accessibility",
    "Title and description",
    "Inline or floating positioning"
])

doc.addParagraph("Example: doc.addImage(DocImage(contentsOf: url, width: 200, altText: \"Description\"))",
                 formatting: TextFormatting(font: .courierNew, color: .gray, fontSize: 10))

doc.addParagraph()

// MARK: - 8. Complex Formatting Example

doc.addHeading1("8. Complex Formatting Example")

let complexPara = doc.addParagraph()
complexPara.spacing = ParagraphSpacing(before: 12, after: 12, lineSpacing: 1.5)

complexPara.addRun(Run(
    text: "This paragraph demonstrates ",
    formatting: TextFormatting(font: .georgia, fontSize: 12)
))
complexPara.addRun(Run(
    text: "multiple formatting styles ",
    formatting: TextFormatting(bold: true, font: .georgia, color: .blue, fontSize: 12)
))
complexPara.addRun(Run(
    text: "in a single paragraph. You can combine ",
    formatting: TextFormatting(font: .georgia, fontSize: 12)
))
complexPara.addRun(Run(
    text: "bold, ",
    formatting: TextFormatting(bold: true, font: .georgia, fontSize: 12)
))
complexPara.addRun(Run(
    text: "italic, ",
    formatting: TextFormatting(italic: true, font: .georgia, fontSize: 12)
))
complexPara.addRun(Run(
    text: "underlined, ",
    formatting: TextFormatting(underline: .single, font: .georgia, fontSize: 12)
))
complexPara.addRun(Run(
    text: "colored, ",
    formatting: TextFormatting(font: .georgia, color: .red, fontSize: 12)
))
complexPara.addRun(Run(
    text: "highlighted ",
    formatting: TextFormatting(font: .georgia, fontSize: 12, highlight: .yellow)
))
complexPara.addRun(Run(
    text: "and ",
    formatting: TextFormatting(font: .georgia, fontSize: 12)
))
complexPara.addRun(Run(
    text: "different sized ",
    formatting: TextFormatting(font: .georgia, fontSize: 16)
))
complexPara.addRun(Run(
    text: "text all in one paragraph!",
    formatting: TextFormatting(bold: true, italic: true, font: .georgia, color: .purple, fontSize: 12)
))

doc.addParagraph()

// MARK: - Summary

doc.addHeading1("Summary")

let summaryPara = doc.addParagraph()
summaryPara.alignment = .both
summaryPara.spacing = ParagraphSpacing(before: 6, after: 12, lineSpacing: 1.5)
summaryPara.addRun(Run(
    text: "This document has demonstrated all the major features of SwiftDocX, including document properties, headers and footers with page numbers, headings (H1-H6), extensive text formatting options (bold, italic, underline, strikethrough, colors, highlights, fonts, sizes, superscript, subscript, caps), paragraph formatting (alignment, spacing, indentation), bullet and numbered lists with nesting, tables with borders and cell styling, hyperlinks, page breaks, and image support. SwiftDocX provides a powerful, native Swift API for creating professional Microsoft Word documents.",
    formatting: TextFormatting(font: .calibri, fontSize: 11)
))

// MARK: - Write Document

print("Writing to: \(outputPath.path)")

do {
    try doc.write(to: outputPath)
    print("Document written successfully!")
} catch {
    print("Error writing document: \(error)")
    exit(1)
}

// MARK: - Summary Output

print("\n=== Document Summary ===")
print("  Title: \(doc.properties.title ?? "Untitled")")
print("  Paragraphs: \(doc.paragraphCount)")
print("  Tables: \(doc.tableCount)")
print("  Total elements: \(doc.elements.count)")

print("\n=== Features Demonstrated ===")
print("  - Document properties (metadata)")
print("  - Headers and footers with page numbers")
print("  - All 6 heading levels (H1-H6)")
print("  - Text formatting: bold, italic, strikethrough")
print("  - 7 underline styles")
print("  - 6 text colors + custom hex colors")
print("  - 6 highlight colors")
print("  - 7 font families")
print("  - Variable font sizes (8pt-36pt)")
print("  - Special effects: superscript, subscript, all caps, small caps")
print("  - Paragraph alignment: left, center, right, justified")
print("  - Paragraph indentation: left, first-line, hanging")
print("  - Bullet lists with 3 nesting levels")
print("  - Numbered lists with 3 nesting levels")
print("  - Basic tables from 2D arrays")
print("  - Styled tables with borders and colors")
print("  - Tables with merged cells (column span)")
print("  - Table accessibility (caption, summary)")
print("  - Hyperlinks with tooltips")
print("  - Page breaks")
print("  - Complex multi-format paragraphs")

print("\n=== Sample Complete ===")
print("Open '\(outputPath.lastPathComponent)' in Microsoft Word or LibreOffice to view the result.")
