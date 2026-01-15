# SwiftDocX

A Swift library for reading and writing Microsoft Word documents (.docx).

## Why SwiftDocX?

We at **Techopolis LLC** built SwiftDocX because we couldn't find a solid, native Swift library for working with Word documents. Existing solutions were either outdated, lacked features, or required bridging to other languages. We needed something that just worked — so we made it ourselves.

## Features

- **Read & Write** - Full support for reading existing .docx files and creating new ones
- **Text Formatting** - Bold, italic, underline, strikethrough, fonts, colors, sizes
- **Headings** - H1 through H6 with proper Word styles
- **Lists** - Bulleted and numbered lists with nesting support
- **Tables** - Create tables with headers, colored cells, borders, and accessibility descriptions
- **Paragraph Styling** - Alignment, spacing, indentation
- **Special Text** - Superscript, subscript, all caps, small caps, highlighting
- **Accessibility** - Document properties, table summaries, language tags
- **Pure Swift** - Native Swift Package Manager support, no bridging required

## Installation

### Swift Package Manager

Add SwiftDocX to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Techopolis/SwiftDocX.git", from: "1.0.0")
]
```

Then add it to your target:

```swift
.target(
    name: "YourApp",
    dependencies: ["SwiftDocX"]
)
```

### Xcode

1. Go to **File > Add Package Dependencies...**
2. Enter: `https://github.com/Techopolis/SwiftDocX.git`
3. Select version **1.0.0** or later
4. Click **Add Package**

## Quick Start

### Creating a Document

```swift
import SwiftDocX

let doc = Document()

// Add a heading
doc.addHeading1("My Document")

// Add a paragraph
doc.addParagraph("This is a simple paragraph.")

// Add formatted text
let para = doc.addParagraph()
para.addRun("Bold text", formatting: TextFormatting(bold: true))
para.addRun(" and ")
para.addRun("red text", formatting: TextFormatting(color: .red))

// Save
try doc.write(to: URL(fileURLWithPath: "output.docx"))
```

### Reading a Document

```swift
let doc = try Document(contentsOf: URL(fileURLWithPath: "input.docx"))

for paragraph in doc.paragraphs {
    print(paragraph.text)
}
```

### Lists

```swift
// Bullet list
doc.addBulletItem("First item")
doc.addBulletItem("Second item")
doc.addBulletItem("Nested item", level: 1)

// Numbered list
doc.addNumberedItem("Step 1")
doc.addNumberedItem("Step 2")
doc.addNumberedItem("Sub-step", level: 1)
```

### Tables

```swift
// Create a table
let table = doc.addTable(rows: 3, columns: 3)
table.rows[0].isHeader = true  // Header repeats on each page
table.setText("Name", at: 0, column: 0, formatting: TextFormatting(bold: true))
table.setText("Alice", at: 1, column: 0)

// Or from an array
let data = [
    ["Product", "Price"],
    ["Widget", "$9.99"]
]
doc.addTable(from: data, hasHeader: true)

// Accessibility for screen readers
table.accessibilityCaption = "Employee List"  // Visible title
table.accessibilitySummary = "Table containing employee names and departments"  // Read by screen readers
```

### Text Formatting

```swift
let formatting = TextFormatting(
    bold: true,
    italic: true,
    underline: .single,
    font: .arial,
    fontSize: 14,
    color: .blue
)

doc.addParagraph("Formatted text", formatting: formatting)
```

## Requirements

- Swift 5.9+
- macOS 10.15+ / iOS 13+ / tvOS 13+ / watchOS 6+

## Dependencies

- [ZIPFoundation](https://github.com/weichsel/ZIPFoundation) - ZIP archive handling

## License

MIT License

## Contributors

- **Taylor Arndt**
- **Michael Doise**

---

Made by **[Techopolis LLC](https://techopolis.app/)**
