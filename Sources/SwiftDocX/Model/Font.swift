import Foundation

/// Represents font properties for text in Word documents
public struct Font: Equatable, Sendable {
    /// Font family name (e.g., "Arial", "Times New Roman")
    public var name: String

    /// Creates a font with the specified name
    public init(name: String) {
        self.name = name
    }

    // MARK: - Common Fonts

    public static let arial = Font(name: "Arial")
    public static let timesNewRoman = Font(name: "Times New Roman")
    public static let calibri = Font(name: "Calibri")
    public static let cambria = Font(name: "Cambria")
    public static let helvetica = Font(name: "Helvetica")
    public static let georgia = Font(name: "Georgia")
    public static let verdana = Font(name: "Verdana")
    public static let courierNew = Font(name: "Courier New")
}
