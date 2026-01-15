import Foundation

/// Error types for document reading operations
public enum DocumentReaderError: Error, LocalizedError {
    case fileNotFound(String)
    case invalidDocument(String)
    case parsingFailed(String)

    public var errorDescription: String? {
        switch self {
        case .fileNotFound(let path):
            return "Document not found: \(path)"
        case .invalidDocument(let detail):
            return "Invalid Word document: \(detail)"
        case .parsingFailed(let detail):
            return "Failed to parse document: \(detail)"
        }
    }
}

/// Reads Word documents from .docx files
public class DocumentReader {
    private let zipReader: ZIPReader
    private let xmlParser: DocumentXMLParser

    public init() {
        self.zipReader = ZIPReader()
        self.xmlParser = DocumentXMLParser()
    }

    /// Reads paragraphs from a .docx file
    public func read(from url: URL) throws -> [Paragraph] {
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw DocumentReaderError.fileNotFound(url.path)
        }

        // Read document.xml from the archive
        let documentData: Data
        do {
            documentData = try zipReader.readEntry(at: url, entryPath: "word/document.xml")
        } catch {
            throw DocumentReaderError.invalidDocument("Could not read document.xml: \(error.localizedDescription)")
        }

        // Parse the XML content
        do {
            return try xmlParser.parseDocumentXML(documentData)
        } catch {
            throw DocumentReaderError.parsingFailed(error.localizedDescription)
        }
    }

    /// Lists the contents of a .docx file (for debugging)
    public func listContents(at url: URL) throws -> [String] {
        return try zipReader.listEntries(at: url)
    }
}
