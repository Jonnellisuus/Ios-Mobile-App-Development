//
//  InfoView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 9.4.2021.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        Text("Tämä sovellus on toteutettu LAB-ammattikorkeakoulun Mobiilisovelluskehitys nimisellä kurssilla. Sovelluksen on kehittänyt Jonne Kiukas keväällä 2021. Sovelluksen tarkoitus on näyttää tieliikennettä käyttävälle ajantasaista tietoa säästä. Käyttäjä valitsee ensin maakunnan, seuraavaksi kaupungin, sitten tien ja lopuksi vielä tiensuunnan, jonka jälkeen näytölle ilmestyy kamerakuva kyseisestä paikasta. Sovelluksen toiminta perustuu Digitraffic nimisen palvelun ylläpitämään avoimeen rajapintaan, josta sovellus hakee kamerakuvat.")
            .padding(20)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
