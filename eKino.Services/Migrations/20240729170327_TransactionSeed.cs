using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class TransactionSeed : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.InsertData(
                table: "Reservations",
                columns: new[] { "ReservationId", "Column", "DateOfReservation", "IsDeleted", "NumTickets", "ProjectionId", "Row", "UserId" },
                values: new object[,]
                {
                    { 19, "x", new DateTime(2024, 4, 15, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 10, 12, "A6, B6, C1, C2, C3, C4, C5, C6, C7, C8", 6 },
                    { 20, "x", new DateTime(2024, 5, 15, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 10, 12, "A5, B5, D1, D2, D3, D4, D5, D6, D7, D8", 6 }
                });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 7, 29, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "TransactionId", "Amount", "DateOfTransaction", "IsDeleted", "ReservationId", "UserId" },
                values: new object[] { 5, 100m, new DateTime(2024, 4, 15, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 19, 6 });

            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "TransactionId", "Amount", "DateOfTransaction", "IsDeleted", "ReservationId", "UserId" },
                values: new object[] { 6, 100m, new DateTime(2024, 5, 15, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 20, 6 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Transactions",
                keyColumn: "TransactionId",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Transactions",
                keyColumn: "TransactionId",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 19);

            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 20);

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 7, 28, 0, 0, 0, 0, DateTimeKind.Local));
        }
    }
}
