//
//  ContactListVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/21.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ContactListVCTL.h"

#import <ContactsUI/ContactsUI.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ContactListVCTL ()
<CNContactPickerDelegate>

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ContactListVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)btn1:(id)sender
{
    [self contact1];
}

- (IBAction)btn2:(id)sender
{
    [self contact2];
}

- (void) contact1
{
    CNContactPickerViewController *cc = [[CNContactPickerViewController alloc] initWithNibName:nil bundle:nil];
    cc.delegate = self;
    [self presentViewController:cc animated:YES completion:nil];
    
}

- (void) contact2
{
    NSString *pp = @"13812345678";
    CNPhoneNumber *nn = [CNPhoneNumber phoneNumberWithStringValue:pp];
    NSLog(@"nn = %@", nn.stringValue);
}


#pragma mark - CNContactPickerDelegate
- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker
{
    NSLog(@"cancel");
}

//- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact
//{
//    NSLog(@"didSelectContact");
//}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    NSLog(@"didSelectContactProperty = %@ - %@ - %@", contactProperty.key, contactProperty.identifier, contactProperty.label);
    NSArray * aaa = contactProperty.contact.phoneNumbers;
    CNContact *cc = contactProperty.contact;
    id vv = contactProperty.value;
    id a1 = contactProperty.key;
    id a12 = contactProperty.identifier;
    id a3 = contactProperty.label;
    CNLabeledValue *lbv = contactProperty.contact.phoneNumbers.firstObject;
    CNPhoneNumber *ss = lbv.value;
    NSLog(@"sss = %@", ss.stringValue);
    NSLog(@"ccc = %@", contactProperty.contact.phoneNumbers);
    NSLog(@"aaa = %@", aaa);
    
    NSLog(@"ss = %@", ss);
    NSLog(@"dd = %@", contactProperty);
}

@end
