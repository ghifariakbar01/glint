# Glint

This glint/shimmer reuasable widget can help you display bring simple yet loading animation while keeping it's usage extremely simple.


## Installation

Use following command line to add this package to your flutter project.

```bash
flutter pub add glint
```

Or manually add to your `pubspec.yml`

```bash
glint: ^0.0.1
```

## Usage

```dart
import 'package:glint/glint.dart';

ListView(
    children: [
       Glint(
         isLoading: true,
         glintItem: GlintItem(itemCount: 10, radius: 4),
         child: Container(),
      )
    ],
 ),
```

***or***

```dart
import 'package:glint/glint.dart';

Container(
    child:
       Glint(
         isLoading: true,
         glintItem: GlintItem(radius: 12),
         child: Text('Something displayed here!')
      )
    ],
 ),
```

## Properties

`Glint` requires following parameters:
   - `isLoading` : true / false
   - `glintItem` : an object of `GlintItem` to be displayed during loading
   - `isLoading` : true / false

### GlintItem

```dart
GlintItem(
  spacing: 5,
  itemCount: 10,
  direction: Axis.vertical,
  height: 50,
  radius: 4,
)
```

- `spacing` is used to separate each `GlintItem` when displayed during loading. 
- `radius` is size of the border radius in circular shape, can be 0 to completely disable border radius.

the rest of the properties is self explanatory, some are not required and posses default values which are:

- *`itemCount = 1`*
- *`spacing = 5`*
- *`direction = Axis.vertical`*
- *`color = Colors.white`*

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change. 

## License

[MIT](https://choosealicense.com/licenses/mit/)