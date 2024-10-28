import UIKit

class SavedViewController: UIViewController {
    let data = dummySavedModel.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        //view.tableView.rowHeight = 99 
        return view
    }()
}

//UITableViewDataSource = 테이블 뷰에 표시될 데이터의 양과 종류 결정, 데이터를 적당한 셀에 할당하는 역할
//UITableViewDelegate = 셀의 높이, 헤더와 푸터의 렌더링, 셀의 선택과 같은 사용자 인터렉션
extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    
    //numberOfRowsInSection = 각 섹션에 표시할 행의 수 반환
    //datalist= 테이블 뷰 위에 표시할 데이터 배열
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        //return dummySavedModel.savedDatas.count
        //???????????return SavedModel.savedDatas.count??아닌가 왜 더미로 하니까 되지.. -> 왜냐면 앞에서 let data=dummySavedModel.savedDatas 해줬으니까...
    }
    
    //cellForRowAt = 커스텀 셀을 재사용 큐에서 가져와 데이터를 설정하는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        cell.configure(model: data[indexPath.row])
        return cell
    }
    
    //didSelectRowAt = 사용자가 특정 행을 선택했을때 호출되는 메서드
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
    //}
}

