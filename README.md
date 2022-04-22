# ios-RxSwift-searchDaumBlog
- 30개프로젝트로배우는 iOS앱개발 with Swift초격차 패키지Online 

<img src="https://user-images.githubusercontent.com/26668309/164585662-70ba7933-1a40-4ad9-9d6e-2799c3adf033.png"
width = 25%> <img src="https://user-images.githubusercontent.com/26668309/164585716-bf07bbe5-328a-4210-ab67-652919364335.png"
width = 25%>


# 사용요소 
- RxSwift 

# 배운내용

- API 호출 시 Single 로 호출 
```Swift 
   func searchBlog(query:String) -> Single<Result<DKBlog,SearchNetworkError>> {
        
        guard let url = api.searchBlog(query: query).url else {
            return .just(.failure(.invalidURL))
        }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(" ", forHTTPHeaderField: "Authorization")
        
        return session.rx.data(request: request as URLRequest)
            .map { data in
                do {
                    let blogData = try JSONDecoder().decode(DKBlog.self, from: data)
                    return .success(blogData)
                } catch {
                    return .failure(.invalidJSON)
                }
            }
            .catch { _ in
                .just(.failure(.networkError))
            }
            .asSingle()
    }

```
- 텍스트 입력값, 버튼 이벤트 PublishRelay 
```Swift 
    let queryText = PublishRelay<String?>() 
    let searchButtonTapped = PublishRelay<Void>()
```

- tableview Rxswift 
```Swift 
    let blogListCellData = PublishSubject<[BlogListCellData]>()
    let cellData: Driver<[BlogListCellData]>
    self.cellData = blogListCellData
            .asDriver(onErrorJustReturn: [])
  
   viewModel.cellData
            .asDriver(onErrorJustReturn: [])
            .drive(self.rx.items) { tv, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = tv.dequeueReusableCell(withIdentifier: "BlogListCell", for: index) as! BlogListCell
                
                cell.setData(data)
                return cell
            }.disposed(by: disposeBag)

```


