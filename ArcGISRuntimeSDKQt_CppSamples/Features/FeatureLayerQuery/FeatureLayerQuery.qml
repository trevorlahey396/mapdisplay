// [WriteFile Name=FeatureLayerQuery, Category=Features]
// [Legal]
// Copyright 2015 Esri.

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

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import Esri.Samples 1.0
import Esri.ArcGISExtras 1.1

FeatureLayerQuerySample {
    id: featureLayerQuerySample
    width: 800
    height: 600

    property double scaleFactor: System.displayScaleFactor

    // add a mapView component
    MapView {
        id: mapView
        anchors.fill: parent
        objectName: "mapView"
    }

    Row {
        id: findRow

        anchors {
            top: parent.top
            bottom: mapView.top
            left: parent.left
            right: parent.right
            margins: 5
        }
        spacing: 5

        TextField {
            id: findText

            width: parent.width * 0.25
            placeholderText: "Enter a state name to select"
            Keys.onReturnPressed: {
                // Call C++ invokable function to run the query
                featureLayerQuerySample.runQuery(findText.text);
            }
        }

        Button {
            text: "Find and Select"
            enabled: featureLayerQuerySample.layerInitialized
            onClicked: {
                // Call C++ invokable function to run the query
                featureLayerQuerySample.runQuery(findText.text);
            }
        }
    }

    // error message dialog
    MessageDialog {
        id: errorMsgDialog
        visible: false
        text: "No state named " + findText.text.toUpperCase() + " exists."
        onAccepted: {
            visible = false;
        }
    }

    onQueryResultsCountChanged: {
        // Use the C++ property to determine if no features were returned
        if (featureLayerQuerySample.queryResultsCount === 0)
            errorMsgDialog.visible = true;
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border {
            width: 0.5 * scaleFactor
            color: "black"
        }
    }
}