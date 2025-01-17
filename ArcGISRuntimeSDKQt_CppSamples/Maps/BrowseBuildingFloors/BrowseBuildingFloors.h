// [WriteFile Name=BrowseBuildingFloors, Category=Maps]
// [Legal]
// Copyright 2022 Esri.

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

#ifndef BROWSEBUILDINGFLOORS_H
#define BROWSEBUILDINGFLOORS_H

namespace Esri
{
namespace ArcGISRuntime
{
class Map;
class MapQuickView;
class FloorManager;
class FloorLevel;
}
}

#include <QObject>

class BrowseBuildingFloors : public QObject
{
  Q_OBJECT

  Q_PROPERTY(Esri::ArcGISRuntime::MapQuickView* mapView READ mapView WRITE setMapView NOTIFY mapViewChanged)

public:
  explicit BrowseBuildingFloors(QObject* parent = nullptr);
  ~BrowseBuildingFloors();

  static void init();
  Q_INVOKABLE void selectFloor(const QString& floor_number);

signals:
  void mapViewChanged();

private:
  Esri::ArcGISRuntime::MapQuickView* mapView() const;
  void setMapView(Esri::ArcGISRuntime::MapQuickView* mapView);

  Esri::ArcGISRuntime::Map* m_map = nullptr;
  Esri::ArcGISRuntime::MapQuickView* m_mapView = nullptr;
  Esri::ArcGISRuntime::FloorManager* m_floorManager = nullptr;
};

#endif // BROWSEBUILDINGFLOORS_H
