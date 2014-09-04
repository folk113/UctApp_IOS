//
//  ZGroupModel.cpp
//  UctApp
//
//  Created by ptyt on 14-9-4.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

#include "ZGroupModel.h"

ZGroupModel::ZGroupModel()
{
    this->users = new list<ZUserModel>();
}

ZGroupModel::~ZGroupModel()
{
    delete this->users;
}

ZGroupModel::ZGroupModel(string name,string number)
{
    this->users = new list<ZUserModel>();
    this->name = name;
    this->number = number;
}
void ZGroupModel::setName(string name)
{
    this->name = name;
}
void ZGroupModel::setNumber(string number)
{
    this->number = number;
}
string ZGroupModel::getName()
{
    return this->name;
}

string ZGroupModel::getNumber()
{
    return this->number;
}
void ZGroupModel::addUser(ZUserModel user)
{
    users->push_back(user);
}
void ZGroupModel::clearUsers()
{
    users->clear();
}
