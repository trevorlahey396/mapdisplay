// [WriteFile Name=FeatureLayerSelection, Category=Features]
// [Legal]
// Copyright 2016 Esri.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// [Legal]

import QtQuick 2.6
import QtQuick.Controls 2.2
import Esri.Samples 1.0

FeatureLayerSelectionSample {
    id: featureLayerSelectionSample
    width: 800
    height: 600

    // add a mapView component
    MapView {
        id: mapView
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: messageBar.top
        }
        objectName: "mapView"

        Component.onCompleted: {
            // Set the focus on MapView to initially enable keyboard navigation
            forceActiveFocus();
        }
    }

    Rectangle {
        id: messageBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 30
        color: "lightgrey"
        border {
            width: 0.5
            color: "black"
        }

        Text {
            id: msgText
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
            // set the text equal to the C++ property
            text: featureLayerSelectionSample.selectedFeatureText
            font.pixelSize: 14
        }
    }
}
