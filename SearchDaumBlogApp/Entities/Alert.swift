//
//  Alert.swift
//  SearchDaumBlogApp
//
//  Created by 김정민 on 2022/04/21.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
