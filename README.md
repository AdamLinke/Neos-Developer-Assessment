# Neos-Developer-Assessment

Before runing the project install pods using
"pod install"
command

You can find diagram for this project architecture in the "architecture.jpeg".

Proposed file structure:
```
ProjectName
- AppDelegate
- SceneDelegate

- HelpersFile
-- ConstantStruct
-- BasicTypesExtensions

- ModelControllersFile
-- ControllerName

- ViewControllersFile
-- NamedViewControllerFile
--- NamedViewController
--- NamedViewController+extensionName
--- NamedViewModel
--- ViewControllerUIElements(containedViews, CustomTableView cells)

- ModelsFile
-- Model
```

In the project you can often find shortcuts like:

VC - ViewController

VM - ViewModel

MC - ModelController


The architecture is a mix between apple's variation of MVC pattern and MVVM patter.
It uses dependency injection and delegation pattern for communication between moduls and viewControllers.
