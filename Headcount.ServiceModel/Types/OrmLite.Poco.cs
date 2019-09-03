﻿
// This file was automatically generated by the PetaPoco T4 Template
// Do not make changes directly to this file - edit the template instead
// 
// The following connection settings were used to generate this file
// 
//     Connection String Name: `Headcount-Local`
//     Provider:               `System.Data.SqlClient`
//     Connection String:      `Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Downloads\Headcount\WebApplication1\App_Data\HeadCount.mdf;Integrated Security=True`
//     Schema:                 ``
//     Include Views:          `True`

//     Factory Name:          `SqlClientFactory`
// Getting PK For AppConfig
// Getting PK For Calendar
// Getting PK For Country
// Getting PK For HeadCount
// Getting PK For Help
// Getting PK For HiringCompany
// Getting PK For LocalPosition
// Getting PK For Location
// Getting PK For Lookup
// Getting PK For LookupType
// Getting PK For Organization
// Getting PK For Position
// Getting PK For Reports
// Getting PK For RoleType
// Getting PK For SecurityPass
// Getting PK For Status
// Getting PK For UploadFileDetails
// Getting PK For UserAuth
// Getting PK For UserAuthAccessLog
// Getting PK For UserRoles
// Getting PK For View_1
// <auto-generated />
// This file was generated by a T4 template.
// Don't change it directly as your change would get overwritten.  Instead, make changes
// to the .tt file (i.e. the T4 template) and save it to regenerate this file.

// Make sure the compiler doesn't complain about missing Xml comments
#pragma warning disable 1591

using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ServiceStack.OrmLite;
using ServiceStack.DataAnnotations;
using ServiceStack.DesignPatterns.Model;
using System.Data.Common;
using System.Data;


namespace Headcount.ServiceModel.Types
{
	[Alias("AppConfig")]
	public partial class AppConfig : IHasId<int> 
	{
		[Alias("ID")]
		[AutoIncrement]
		public int Id { get; set;}
		[Required]
		public string Name { get; set;}
		[Required]
		public string Value { get; set;}
	}
	[Alias("Calendar")]
	public partial class Calendar : IHasId<DateTime> 
	{
		[Alias("dt")]
		[Required]
		public DateTime Id { get; set;}
		public bool? isWeekday { get; set;}
		public bool? isHoliday { get; set;}
		public short? Y { get; set;}
		public short? FY { get; set;}
		public byte? Q { get; set;}
		public byte? M { get; set;}
		public byte? D { get; set;}
		public byte? DW { get; set;}
		public string monthname { get; set;}
		public string dayname { get; set;}
		public byte? W { get; set;}
		public byte? UTCOffset { get; set;}
		public string HolidayDescription { get; set;}
	}
	[Alias("Country")]
	public partial class Country : IHasId<int> 
	{
		[Alias("ID")]
		[AutoIncrement]
		public int Id { get; set;}
		[Required]
		public string Name { get; set;}
	}
	[Alias("HeadCount")]
	public partial class HeadCount : IHasId<int> 
	{
		[Alias("HeadCountID")]
		[AutoIncrement]
		public int Id { get; set;}
		public string Surname { get; set;}
		public string Forename { get; set;}
		public string Personnel_NO { get; set;}
		public int? StatusID { get; set;}
		public int? HiringCompanyID { get; set;}
		public string SAP_PositionID { get; set;}
		public string PositionName { get; set;}
		public int? OrganizationID { get; set;}
		public int? LineManagerID { get; set;}
		public string LineManager_NO { get; set;}
		public bool? SAP_Org_Chart { get; set;}
		public bool? C_BAY { get; set;}
		public bool? I_Phone { get; set;}
		public int? SecurityPassID { get; set;}
		public int? ApproveManagerID { get; set;}
		public string UserID { get; set;}
		public string Phone_Extn { get; set;}
		public string IT_Hardware { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdatedDate { get; set;}
		public DateTime? StartDate { get; set;}
		public DateTime? ExpectedEndDate { get; set;}
		public bool? Active { get; set;}
		public DateTime? ActualEndDate { get; set;}
		public bool? IsSubmitted { get; set;}
		public bool? IsSaved { get; set;}
		public bool? IsSecurityEdited { get; set;}
		public string SAP_Position_Code { get; set;}
		public string FTE { get; set;}
		public string LocalPositionCode { get; set;}
		public int? LocationID { get; set;}
		public bool? Desk { get; set;}
		public int? RoleTypeID { get; set;}
	}
	[Alias("HiringCompany")]
	public partial class HiringCompany : IHasId<int> 
	{
		[Alias("HiringCompanyID")]
		[AutoIncrement]
		public int Id { get; set;}
		public string HiringCompanyName { get; set;}
		public string HiringCompanyDescription { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("LocalPosition")]
	public partial class LocalPosition : IHasId<int> 
	{
		[Alias("Id")]
		[AutoIncrement]
		public int Id { get; set;}
		public string LocalPositionCode { get; set;}
		public string Description { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("LookupType")]
	public partial class LookupType : IHasId<long> 
	{
		[Alias("ID")]
		[AutoIncrement]
		public long Id { get; set;}
		[Required]
		public string Name { get; set;}
		[Required]
		public string Description { get; set;}
		[Required]
		public int SecurityNo { get; set;}
		[Required]
		public string Audit_UpdatedBy { get; set;}
		[Required]
		public DateTime Audit_UpdatedDate { get; set;}
		[Required]
		public string Audit_CreatedBy { get; set;}
		[Required]
		public DateTime Audit_CreatedDate { get; set;}
		public string LookupTypeALIAS { get; set;}
	}
	[Alias("Organization")]
	public partial class Organization : IHasId<int> 
	{
		[Alias("OrganizationID")]
		[AutoIncrement]
		public int Id { get; set;}
		public string OrganizationName { get; set;}
		public string OrganizationDescription { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("Position")]
	public partial class Position : IHasId<int> 
	{
		[Alias("Id")]
		[AutoIncrement]
		public int Id { get; set;}
		public string PositionName { get; set;}
		public string Description { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("RoleType")]
	public partial class RoleType : IHasId<int> 
	{
		[Alias("RoleTypeId")]
		[AutoIncrement]
		public int Id { get; set;}
		public string RoleTypeName { get; set;}
		public string RoleTypeDescription { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("SecurityPass")]
	public partial class SecurityPass : IHasId<int> 
	{
		[Alias("SecurityPassID")]
		[AutoIncrement]
		public int Id { get; set;}
		public string SecurityPassName { get; set;}
		public string SecurityPassDescription { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("Status")]
	public partial class Status : IHasId<int> 
	{
		[Alias("StatusID")]
		[AutoIncrement]
		public int Id { get; set;}
		public string StatusName { get; set;}
		public string StatusDescription { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("UploadFileDetails")]
	public partial class UploadFileDetail : IHasId<int> 
	{
		[Alias("ID")]
		[AutoIncrement]
		public int Id { get; set;}
		[Required]
		public int HeadCountID { get; set;}
		[Required]
		public string Name_File { get; set;}
		public string DisplayName { get; set;}
		[Required]
		public string Extension { get; set;}
		public string ContentType { get; set;}
		[Required]
		public byte[] FileData { get; set;}
		public long? FileSize { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdatedDate { get; set;}
		[Required]
		public string UploadType { get; set;}
	}
	[Alias("UserRoles")]
	public partial class UserRole : IHasId<int> 
	{
		[Alias("RoleID")]
		[AutoIncrement]
		public int Id { get; set;}
		public string RoleName { get; set;}
		public string RoleDescription { get; set;}
		public string UpdatedBy { get; set;}
		public DateTime? UpdateDate { get; set;}
		public string CreatedBy { get; set;}
		public DateTime? CreatedDate { get; set;}
		[Required]
		public bool Active { get; set;}
		[Required]
		public long LookupTypeID { get; set;}
	}
	[Alias("View_1")]
	public partial class View_1 
	{
		[Required]
		public int HeadCountID { get; set;}
		public string PositionName { get; set;}
		public string Surname { get; set;}
		public string Forename { get; set;}
		public int? LineManagerID { get; set;}
		public int? Emps { get; set;}
		public string LocalPositionCode { get; set;}
	}
}
#pragma warning restore 1591





