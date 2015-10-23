//
//  ContactListVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/21.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ContactListVCTL.h"
#import "Helper.h"

#import <ContactsUI/ContactsUI.h>

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ContactListVCTL ()
<CNContactPickerDelegate, ABPeoplePickerNavigationControllerDelegate>

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
    // ios9
    if (kIOSVersion(9.0))
    {
        CNContactPickerViewController *cc = [[CNContactPickerViewController alloc] initWithNibName:nil bundle:nil];
        cc.delegate = self;
        [self presentViewController:cc animated:YES completion:nil];
    }
    else
    {
        NSLog(@"9.0  is required");
    }
    
}

- (void) contact2
{
    // ios 7 8
    if (kIOSVersion(9.0) == NO)
    {
        ABPeoplePickerNavigationController *ab = [[ABPeoplePickerNavigationController alloc] init];
        ab.peoplePickerDelegate = self;
        [self presentViewController:ab animated:YES completion:nil];
        
    }
    else
    {
        NSLog(@"not in ios 9");
    }
    
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


#pragma mark - ABPeoplePickerNavigationControllerDelegate
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    // ios8
    NSLog(@"");
    [self didSelectPerson:person identifier:identifier];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    // ios 7
    [self didSelectPerson:person identifier:identifier];
    return NO;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    NSLog(@"cancel");
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didSelectPerson:(ABRecordRef)person identifier:(ABMultiValueIdentifier)identifier
{
    NSString *phone_numbers = @"no email address";
    ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonPhoneProperty);
    if (emails)
    {
        if (ABMultiValueGetCount(emails) > 0)
        {
            CFIndex index = 0;
            if (identifier != kABMultiValueInvalidIdentifier)
            {
                index = ABMultiValueGetIndexForIdentifier(emails, identifier);
            }
            phone_numbers = CFBridgingRelease(ABMultiValueCopyValueAtIndex(emails, index));
        }
        CFRelease(emails);
    }
    
    NSLog(@"select phone number = %@", phone_numbers);
}

@end
