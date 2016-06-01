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
    
    
    [self fun3];
}

- (void)createLocalDirectory
{
    _localDirectoryPath =[NSString stringWithFormat:@"%@/Documents/SaveDataVCTL", NSHomeDirectory()];
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:_localDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSLog(@"create directory = %d", success);
}

- (IBAction)btn1:(id)sender
{
    [self fun2Decode];
}

- (void)fun3
{
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
    NSString *path = [NSString stringWithFormat:@"%@/fun1", _localDirectoryPath];
    
    NSString *ss = @"ss";
    NSData *dd = [ss dataUsingEncoding:NSUTF8StringEncoding];
    
    BOOL success = [[NSFileManager defaultManager] createFileAtPath:path contents:dd attributes:nil];
    
    NSLog(@"ss = %d", success);
}

- (void)fun2
{
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
