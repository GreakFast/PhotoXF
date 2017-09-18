
import UIKit

class StampViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let stampArray = [
        UIImage(named: "電球.png"),
        UIImage(named: "雷.png"),
        UIImage(named: "頭悪い.png"),
        UIImage(named: "Yazirusi.png"),
        UIImage(named: "hukidasi.png"),
        UIImage(named: "kibana.png"),
        UIImage(named: "hatena.png"),
        UIImage(named: "hibi.png"),
        UIImage(named: "honou.png"),
        UIImage(named: "kemuri.png"),
        UIImage(named: "KIS.png"),
        UIImage(named: "キラキラ.png"),
        UIImage(named: "ビックリマーク.png"),
        UIImage(named: "星一つ.png"),
        UIImage(named: "星二つ.png"),
        UIImage(named: "立ち入り禁止.png"),
        UIImage(named: "ハート1.png"),
        UIImage(named: "ハート2.png"),
        UIImage(named: "時計.png"),
        UIImage(named: "ターゲット1.png"),
        UIImage(named: "ターゲット2.png"),
        UIImage(named: "ターゲット3.png"),
        UIImage(named: "思い出し1.png"),
        UIImage(named: "思い出し2.png"),
        UIImage(named: "禁止1.png"),
        UIImage(named: "禁止2.png"),
        UIImage(named: "禁止3.png"),
        UIImage(named: "OK21.png"),
        UIImage(named: "OK2.png"),
        UIImage(named: "OK3.png"),
        UIImage(named: "音符1.png"),
        UIImage(named: "音符2.png"),
        UIImage(named: "音符3.png"),
        UIImage(named: "音符4.png"),
        UIImage(named: "音符5.png"),
        UIImage(named: "はさみ1.png"),
        UIImage(named: "はさみ2.png"),
        UIImage(named: "メールボックス1.png"),
        UIImage(named: "メールボックス2.png"),
        UIImage(named: "メールボックス3.png"),
        UIImage(named: "メールボックス4.png"),
        UIImage(named: "リサイクルしよう.png"),
        UIImage(named: "カーソル1.png"),
        UIImage(named: "カーソル2.png"),
        UIImage(named: "カーソル3.png"),
        UIImage(named: "傘1.png"),
        UIImage(named: "傘2.png"),
        UIImage(named: "傘3.png"),
        UIImage(named: "傘4.png"),
        UIImage(named: "水泳1.png"),
        UIImage(named: "水泳2.png"),
        UIImage(named: "水泳3.png"),
        UIImage(named: "地球1.png"),
        UIImage(named: "地球2.png"),
        UIImage(named: "地球3.png"),
        UIImage(named: "地球4.png"),
        UIImage(named: "Camera.png"),
        UIImage(named: "フィルム1.png"),
        UIImage(named: "フィルム2.png"),
        UIImage(named: "フィルム3.png"),
        UIImage(named: "人1.png"),
        UIImage(named: "人2.png"),
        UIImage(named: "人3.png"),
        UIImage(named: "人4.png"),
        UIImage(named: "人5.png"),
        UIImage(named: "人6.png"),
        UIImage(named: "車椅子1.png"),
        UIImage(named: "車椅子2.png"),
        UIImage(named: "車椅子3.png"),
        UIImage(named: "飛行機1.png"),
        UIImage(named: "飛行機2.png"),
        UIImage(named: "飛行機3.png"),
        UIImage(named: "対処.png"),
        UIImage(named: "お守り.png")
        
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
