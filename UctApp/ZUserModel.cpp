//
//  ZUserModel.cpp
//  UctApp
//
//  Created by ptyt on 14-9-4.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

#include "ZUserModel.h"

ZUserModel::ZUserModel()
{
    
}

ZUserModel::~ZUserModel()
{
    
}

ZUserModel::ZUserModel(string name,string number)
{
    this->name = name;
    this->number = number;
}

void ZUserModel::setName(string name)
{
    this->name = name;
}

void ZUserModel::setNumber(string number)
{
    this->number = number;
}

string ZUserModel::getName()
{
    return name;
}
string ZUserModel::getNumber()
{
    return number;
}