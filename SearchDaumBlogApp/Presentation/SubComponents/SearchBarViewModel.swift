//
//  SearchBarViewModel.swift
//  SearchDaumBlogApp
//
//  Created by 김정민 on 2022/04/21.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
    
    let queryText = PublishRelay<String?>() 
    let searchButtonTapped = PublishRelay<Void>()
    let shouldLoadResult: Observable<String>
    

    
    
}
