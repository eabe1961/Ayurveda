
//  Corpus.swift

import UIKit

class Corpus {

    var fullresourcepath = ""
    var chapternumbers = [String]() // The chapter numbers, eg. "1", "1.1", "1.2", "2", ...
    var chapterfilenames = [String: String]() // The filenames of the chapters, eg. "1.1" => "Texts/Introduction.html"
    var chapters = [String: String]() // Mapping of chapternr to chapter title, eg. "1.1" => "Introduction"

    var chaptercount: Int {
        get {
            return chapters.count
            }
        }

    func chapternumber(volgnr: Int) -> String {
        return chapternumbers[volgnr]
        }

    func chaptertitle(chapternr: String) -> String {
        return chapters[chapternr]!
        }

    func chapterimage(chapternr: String) -> UIImage? {
        let fn = fullresourcepath + "/" + chapternr + ".jpg"
        return UIImage(contentsOfFile: fn)
        }

    func chaptertext(chapternr: String) -> String {
        let basefn = chapterfilenames[chapternr]!
        let fn = Bundle.main.path(forResource: basefn, ofType: "")!
        var s = ""
        do {
            s = try String(contentsOfFile: fn, encoding: String.Encoding.utf8)
            }
        catch {
            s = "Error: Can't read contents of bundle file '\(fn)'"
            }
        return s
        }

    func extractmetadata(filename: String) -> (String, String) {
        return ("TODO TITLE", "TODO SUBTITLE")
        }

    init(subdir: String = "", prefix: String) {
        var pad = Bundle.main.resourcePath!
        if subdir != "" {
            pad += "/" + subdir
            }
        fullresourcepath = pad
        do {
            let filenames = try FileManager.default.contentsOfDirectory(atPath: pad)
            for filename in filenames.sorted() {
                if (filename.hasPrefix(prefix)) {
                    let parts = filename.components(separatedBy: " - ")
                    let chapter_and_nr = parts[0]
                    let title_and_ext = parts[1]
                    let titlesubparts = title_and_ext.components(separatedBy: ".html")
                    let title = titlesubparts[0]
                    let chaptersubparts = chapter_and_nr.components(separatedBy: " ")
                    let chapternr = chaptersubparts[1]
                    chapternumbers.append(chapternr)
                    chapters[chapternr] = title
                    var fullfilename = filename
                    if subdir != "" {
                        fullfilename = subdir + "/" + filename
                        }
                    chapterfilenames[chapternr] = fullfilename
                    // TODO: Parse HTML & determine title and subtitle
                    var headertitle = "", headersubtitle = ""
                    (headertitle, headersubtitle) = extractmetadata(filename: fullfilename)
                    }
                }
            }
        catch {
            print(error)
            }
        }
    }
