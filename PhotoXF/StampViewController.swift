
import UIKit

class StampViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let stampArray = [
        UIImage(named: "電球.png"),
        UIImage(named: "雷.png"),
        UIImage(named: "頭悪い.png"),
        UIImage(named: "Yazirusi.png"),
        UIImage(named: "hukidasi.png"),
        UIImage(named: "kibana.png"),
        UIImage(named: "星一つ.png"),
        UIImage(named: "hatena.png"),
        UIImage(named: "hibi.png"),
        UIImage(named: "honou.png"),
        UIImage(named: "kemuri.png"),
        UIImage(named: "KIS.png"),
        UIImage(named: "キラキラ.png"),
        UIImage(named: "ビックリマーク.png")
    ]
    
    func  collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return stampArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = stampArray[indexPath.row]
        return cell;
    }
    
    func  collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let delegate =  UIApplication.shared.delegate as! AppDelegate
        delegate.image = stampArray[indexPath.row]
        delegate.isStampAdded = true
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
