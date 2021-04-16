//
//  News.swift
//  Втехникуме
//
//  Created by 35 кабинет 9 on 07.04.2021.
//

import UIKit
protocol  NewsDelegate {
    
    func loaded(news: [News])
    
}
class News: UIViewController {
    
    var delegate: NewsDelegate?

    func LoadNews(){
        let url = URL (string: "http://www.btsi.ru/index.php?option=com_content&view=category&layout=blog&id=23&Itemid=55")!
        let request = URLRequest(url:url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
            let jsonDict = json as? NSDictionary{
               
//                print(json)
                print(type(of: json))
                var news: [News] = []
                for (_, data) in jsonDict where data is NSDictionary{
//                   if let new = News(data: data as! NSDictionary){news.append(new)}
                    
                    
                }
                print(news.count)
                self.delegate?.loaded(news: news)
            }
        }
        task.resume()
        
    }

        
    }
    

    
    


