import UIKit

final class GameViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  

}

// MARK: - UICollectionViewDelegate
extension GameViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  }
}
