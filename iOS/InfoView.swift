//
//  InfoView.swift
//  deTeX
//
//  Created by Venkat on 26/8/20.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
            List {
                Section(header: HStack {
                                    Text(appVersion())
                        })
                {
                    Text("Made, with ❤️, by Venkat. Inspired by Detexify, I wanted to make a native iOS app for translating hand-drawn symbols to their corresponding LaTeX commands that was fast, efficient, and light. DeTeXt is the result.")
                }
                
                Section(header: HStack {
                                    Image(systemName: "wand.and.stars")
                                    Text("How it works")
                                    })
                {
                    Text("DeTeXt uses a MobileNet_v2 PyTorch model trained on the Detexify training data, which was then translated to CoreML using ") +
                    Text("coremltools").font(.system(.body, design: .monospaced)) +
                    Text(".\n\nThe symbol images are generated by converting PDF files containing each symbol (made with LaTeX) to SVG files. All symbols are typeset in their default font.\n\nThe source code for DeTeXt is available on GitHub under the MIT License.")
                    HStack{
                        Image(systemName: "cloud.fill")
                            .font(.body)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, alignment: .center)
                            .foregroundColor(.blue)
                        Link("DeTeXt repository", destination: URL(string: "https://github.com/venkatasg/DeTeXt")!)
                            .foregroundColor(.primary)
                    }
                    HStack{
                        Image(systemName: "wand.and.rays")
                            .font(.body)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, alignment: .center)
                            .foregroundColor(.red)
                        Link("Detexify website", destination: URL(string: "http://detexify.kirelabs.org")!)
                            .foregroundColor(.primary)
                    }
                    HStack {
                        Image(systemName: "doc.fill")
                            .font(.body)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, alignment: .center)
                            .foregroundColor(.gray)
                        Link("coremltools Documentation", destination: URL(string: "https://coremltools.readme.io")!)
                            .foregroundColor(.primary)
                    }
                    HStack {
                        Image(systemName: "function")
                            .font(.body)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, alignment: .center)
                            .foregroundColor(.green)
                        Link("MobileNet_v2 PyTorch", destination: URL(string: "https://pytorch.org/docs/stable/torchvision/models.html#torchvision.models.mobilenet_v2")!)
                            .foregroundColor(.primary)
                    }
                }
                
                Section(header: HStack {
                                    Image(systemName: "hand.thumbsup")
                                    Text("Credits")
                                    })
                {
                    Text("Thanks to Daniel Kirsch and the team at Detexify for their cool open-source web app that inspired me to make DeTeXt, and for providing the training data and prompt responses to my questions. \n\nThanks to Will Bishop for helping me figure out a tricky problem I had with the PencilKit APIs.\n\nA big thanks to Hans for beta testing new features and giving valuable feedback. \n\nFinally a big thanks to all the folks on the NetNewsWire Slack for being supportive and inspiring me to build my own iOS app.")
                    Link("Will Bishop", destination: URL(string: "https://willbish.com")!)
                    Link("Hans", destination: URL(string: "https://twitter.com/SherlockHans")!)
                    Link("NetNewsWire", destination: URL(string: "https://ranchero.com/netnewswire/")!)
                }
                
            }
            .listStyle(InsetGroupedListStyle())
    
        .navigationBarTitle("About DeTeXt", displayMode: .inline)
    }
}


struct Info_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewDevice("iPhone 11 Pro Max")
    }
}