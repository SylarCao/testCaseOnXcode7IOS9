//
//  SaveDataVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/1.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "SaveDataVCTL.h"
#import "DataObject1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface SaveDataVCTL ()

@property (nonatomic, strong) NSArray *data;

@property (nonatomic, strong) DataObject1 *model;


@property (nonatomic, strong) NSString *localDirectoryPath;


@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SaveDataVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 本地文件夹建立
    [self createLocalDirectory];
    
    
//    [self fun1];
    
    
//    [self fun2];
    
    
//    [self fun3];
    
    [self fun4];
}

- (void)createLocalDirectory
{
    _localDirectoryPath =[NSString stringWithFormat:@"%@/Documents/SaveDataVCTL", NSHomeDirectory()];
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:_localDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSLog(@"create directory = %d", success);
}

- (IBAction)btn1:(id)sender
{
//    [self fun2Decode];
    
    [self fun4Decode];
}

- (void)fun4
{
    // 保存 array of DataObject1
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++)
    {
        DataObject1 *obj = [[DataObject1 alloc] initWithRandom0];
        [arr addObject:obj];
    }
    
    NSString *path = [NSString stringWithFormat:@"%@/fun4", _localDirectoryPath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr];
    
    BOOL ss = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    
    NSLog(@"ss = %d", ss);
}

- (void)fun4Decode
{
    NSString *path = [NSString stringWithFormat:@"%@/fun4", _localDirectoryPath];
    
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
    
    NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSArray *aa = @[@"1", @"2"];
    
    NSMutableArray *mm = [[NSMutableArray alloc] initWithArray:arr];
    
    NSString *ss = @"sss";
    [mm addObject:ss];
    
    NSLog(@"obj1 = %@ - %@", mm, aa);

}


- (void)fun3
{
    // core data 需要project支持
    NSManagedObjectContext *context = [self managedObjectContext];
    
//    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
//    [newDevice setValue:self.nameTextField.text forKey:@"name"];
//    [newDevice setValue:self.versionTextField.text forKey:@"version"];
//    [newDevice setValue:self.companyTextField.text forKey:@"company"];
}


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)fun1
{
    // 本地保存 一个 NSString
    NSString *path = [NSString stringWithFormat:@"%@/fun1", _localDirectoryPath];
    
    NSString *ss = @"ss";
    NSData *dd = [ss dataUsingEncoding:NSUTF8StringEncoding];
    
    BOOL success = [[NSFileManager defaultManager] createFileAtPath:path contents:dd attributes:nil];
    
    NSLog(@"ss = %d", success);
}

- (void)fun2
{
    // 本地保存一个 DataObject1
    NSString *path = [NSString stringWithFormat:@"%@/fun2", _localDirectoryPath];
    
    _model = [[DataObject1 alloc] initWithRandom1];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_model];
    
    BOOL ss = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    
    NSLog(@"ss = %d", ss);
}

- (void)fun2Decode
{
    NSString *path = [NSString stringWithFormat:@"%@/fun2", _localDirectoryPath];
    
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
    
    DataObject1 *obj1 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"obj1 = %@", obj1);
    
    _lb1.backgroundColor = obj1.color;
}




@end
