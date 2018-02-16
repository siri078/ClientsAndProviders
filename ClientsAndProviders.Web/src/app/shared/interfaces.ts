import { ModuleWithProviders} from '@angular/core';
import { Routes } from '@angular/router';

export interface IProvider {
    providerId: number;
    firstName: string;
    lastName: string;
    address: string;
    city: string;
    zipCode: string;
    phone: string;
    active: boolean;
    gender: string;
    hireDate: string;
    emailAddr: string;
    notes: string;
    createdDate: string;
    createdBy: string;
    lastModifiedDate: string;
    aastModifiedBy: string;
    providerAvailableShifts?: IProviderAvailableShifts[];
    providerSvcCodes?: IProviderSvcCodes[];
}

export interface IProviderAvailableShifts {
    ProviderId: number;
    DayOfWeek: string;
    Shift: string;
    HasBeenScheduled: boolean;
    CreatedDate: string;
    CreatedBy: string;
    LastModifiedDate: string;
    LastModifiedBy: string;
}

export interface IProviderSvcCodes {
    ProviderId: number;
    SvcCode: string;
    CreatedDate: string;
    CreatedBy: string;
    LastModifiedDate: string;
    LastModifiedBy: string;
}

export interface IClient {
    ClientId: number;
    FirstName: string;
    LastName: string;
    Phone: string;
    Address: string;
    City: string;
    ZipCode: string;
    Active: boolean;
    Gender: string;
    Birthdate: string;
    EmailAddr: string;
    GenderPreference: string;
    ResponsibleParty: string;
    ResponsiblePartyContact: string;
    Notes: string;
    CreateDate: string;
    CreatedBy: string;
    LastModifiedDate: string;
    LastModifiedBy: string;
    ClientShiftAssignments?: IProviderAvailableShifts[];
    ClientSvcCodes?: IProviderSvcCodes[];
}

export interface IClientSvcCodes {
    ClientId: number;
    SvcCode: string;
    CreatedDate: string;
    CreatedBy: string;
    LastModifiedDate: string;
    LastModifiedBy: string;
}

export interface IClientShiftAssignments {
   ClientId: number;
   DayOfWeek: string;
   Shift: string;
   ProviderId: string;
   CreatedDate: string;
   CreatedBy: string;
   LastModifiedDate: string;
   LastModifiedBy: string; 
}

export interface IApiResponse {
    status: boolean;
    error?: string;
}

export interface ICheckableItem {
    value: any;
    isChecked: boolean;
  }
