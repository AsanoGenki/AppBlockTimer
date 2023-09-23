//
//  CustomSlider.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI
import AudioToolbox

struct CustomSlider<Content: View> : UIViewRepresentable {
    
    var content: Content
    var pickerCount: Int
    
    @Binding var offset: CGFloat
    
    init(pickerCount: Int,offset: Binding<CGFloat>,@ViewBuilder content: @escaping ()->Content) {
        self.content = content()
        self._offset = offset
        self.pickerCount = pickerCount
    }
    
    
    func makeCoordinator() -> Coordinator {
        return CustomSlider.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        let swiftUIView = UIHostingController(rootView: content).view!
        
        let width = CGFloat((pickerCount * 5) * 20) + (getRect().width - 30)
        
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        swiftUIView.backgroundColor = nil
        
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        scrollView.backgroundColor = nil
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator: NSObject,UIScrollViewDelegate{
        
        var parent: CustomSlider
        
        init(parent: CustomSlider) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            let value = (offset / 20).rounded(.toNearestOrAwayFromZero)
            
            scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate{
                let offset = scrollView.contentOffset.x
                
                let value = ((offset / 20) / 5).rounded(.toNearestOrAwayFromZero) * 5
                
                scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
            }
        }
    }
}

func getRect()->CGRect{
    return UIScreen.main.bounds
}


//sliderのoffset値をString型の数値に変える
func sliderOffsetToString(offset: CGFloat)->String{
    let startWeight = 15
    let progress = offset / 20
    
    return "\(startWeight + (Int(progress) * 1))"
}
