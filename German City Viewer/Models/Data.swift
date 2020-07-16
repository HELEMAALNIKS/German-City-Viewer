import SwiftUI
import CoreLocation

public class CityFetcher: ObservableObject {

    @Published var cities = [City]()
    
    init(){
        load()
    }
    
    func load() {
        //Define URL where JSON is located
        let url = URL(string: "https://raw.githubusercontent.com/HELEMAALNIKS/German-City-Viewer/master/German%20City%20Viewer/Resources/cityData.json")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    //Decode JSON
                    let decodedLists = try JSONDecoder().decode([City].self, from: d)
                    DispatchQueue.main.async {
                        self.cities = decodedLists
                    }
                } else {
                    //Print if data is empty
                    print("No Data")
                }
            } catch {
                //Print if data is invalid
                print ("Error")
            }
            
        }.resume()
         
    }
}


final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    //Constant, because the function will never change
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}


struct Data_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
