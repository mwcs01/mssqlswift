This project ueses code from [https://github.com/martinrybak/SQLClient](Link URL)

This project is Built with Xcode 8.3 and Swift 3.

If you try to recreate this or add the SQLClient files to your own project. Somethings that you will need to watch for.

1) Make sure in your target - general - linked framework and libraries you have ```libiconv.tb``` and ```libfreetds.a```

2) Make sure in your bridging header file you include ```#import "SQLClient.h"```