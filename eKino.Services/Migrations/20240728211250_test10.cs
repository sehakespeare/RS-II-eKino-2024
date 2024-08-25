using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class test10 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Reservations",
                columns: new[] { "ReservationId", "Column", "DateOfReservation", "IsDeleted", "NumTickets", "ProjectionId", "Row", "UserId" },
                values: new object[] { 18, "x", new DateTime(2024, 3, 15, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 10, 12, "A7, B7", 6 });

            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "TransactionId", "Amount", "DateOfTransaction", "IsDeleted", "ReservationId", "UserId" },
                values: new object[] { 3, 20m, new DateTime(2023, 11, 12, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 17, 6 });

            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "TransactionId", "Amount", "DateOfTransaction", "IsDeleted", "ReservationId", "UserId" },
                values: new object[] { 4, 100m, new DateTime(2024, 3, 15, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 18, 6 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Transactions",
                keyColumn: "TransactionId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Transactions",
                keyColumn: "TransactionId",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 18);
        }
    }
}
