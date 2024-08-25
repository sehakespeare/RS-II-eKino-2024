using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class test5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "TransactionId", "Amount", "DateOfTransaction", "IsDeleted", "ReservationId", "UserId" },
                values: new object[] { 1, 20m, new DateTime(2023, 11, 12, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 15, 4 });

            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "TransactionId", "Amount", "DateOfTransaction", "IsDeleted", "ReservationId", "UserId" },
                values: new object[] { 2, 20m, new DateTime(2023, 11, 12, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 16, 4 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Transactions",
                keyColumn: "TransactionId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Transactions",
                keyColumn: "TransactionId",
                keyValue: 2);
        }
    }
}
