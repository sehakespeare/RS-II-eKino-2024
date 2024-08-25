using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class DodavanjeRatinga : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Ratings",
                columns: new[] { "RatingId", "DateOfRating", "IsDeleted", "MovieId", "UserId", "Value" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 1, 4, 5 },
                    { 2, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 2, 4, 5 },
                    { 3, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 3, 4, 5 },
                    { 4, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 4, 4, 5 },
                    { 5, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 5, 4, 5 },
                    { 6, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 6, 4, 5 },
                    { 7, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 7, 4, 5 },
                    { 8, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 8, 4, 5 },
                    { 9, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 9, 4, 5 },
                    { 10, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 1, 3, 5 },
                    { 11, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 2, 3, 5 },
                    { 12, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 3, 3, 5 },
                    { 13, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 4, 3, 5 },
                    { 14, new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local), false, 5, 3, 5 }
                });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1,
                column: "UserId",
                value: 4);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2,
                column: "UserId",
                value: 4);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3,
                column: "UserId",
                value: 4);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 4,
                column: "UserId",
                value: 4);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 5,
                column: "ProjectionId",
                value: 5);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 6,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 6, 4 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 7,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 8,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 2, 3 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 9,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 3, 3 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 10,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 4, 3 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 11,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 5, 3 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 12,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 7, 4 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 13,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 8, 4 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 14,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 9, 4 });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13);

            migrationBuilder.DeleteData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1,
                column: "UserId",
                value: 3);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2,
                column: "UserId",
                value: 3);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3,
                column: "UserId",
                value: 3);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 4,
                column: "UserId",
                value: 3);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 5,
                column: "ProjectionId",
                value: 2);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 6,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 3, 5 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 7,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 4, 6 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 8,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 4, 6 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 9,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 5, 7 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 10,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 6, 8 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 11,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 7, 9 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 12,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 8, 10 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 13,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 9, 11 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 14,
                columns: new[] { "ProjectionId", "UserId" },
                values: new object[] { 10, 12 });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));
        }
    }
}
