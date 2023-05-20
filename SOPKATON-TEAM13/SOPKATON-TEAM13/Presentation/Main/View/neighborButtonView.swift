//
//  neighborButton.swift
//  SOPKATON-TEAM13
//
//  Created by KYUBO A. SHIM on 2023/05/21.
//

import UIKit

class neighborButtonView: UIButton {
    
    private var address: Int
    private var pokedCount: Int
    
    init(addressNumber address: Int, pokedCount: Int) {
        self.address = address
        self.pokedCount = pokedCount
        super.init(frame: .zero)
        
        setUI()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension neighborButtonView {
    
    private func setUI() {
        
    }
    
    private func setLayout() {
        
    }
}
