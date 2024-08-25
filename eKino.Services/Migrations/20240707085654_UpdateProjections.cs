using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class UpdateProjections : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 11,
                column: "DateOfProjection",
                value: new DateTime(2024, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 12,
                column: "DateOfProjection",
                value: new DateTime(2024, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 13,
                column: "DateOfProjection",
                value: new DateTime(2024, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 14,
                column: "DateOfProjection",
                value: new DateTime(2024, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 15,
                column: "DateOfProjection",
                value: new DateTime(2024, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.InsertData(
                table: "Reservations",
                columns: new[] { "ReservationId", "Column", "DateOfReservation", "IsDeleted", "NumTickets", "ProjectionId", "Row", "UserId" },
                values: new object[,]
                {
                    { 15, "x", new DateTime(2023, 11, 12, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 2, 11, "A2, B1", 4 },
                    { 16, "x", new DateTime(2023, 11, 12, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 2, 12, "A2, B1", 4 }
                });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 7, 7, 0, 0, 0, 0, DateTimeKind.Local));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 15);

            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 16);

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 11,
                column: "DateOfProjection",
                value: new DateTime(2022, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 12,
                column: "DateOfProjection",
                value: new DateTime(2022, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 13,
                column: "DateOfProjection",
                value: new DateTime(2022, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 14,
                column: "DateOfProjection",
                value: new DateTime(2022, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 15,
                column: "DateOfProjection",
                value: new DateTime(2022, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 7, 6, 0, 0, 0, 0, DateTimeKind.Local));

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
    }
}
