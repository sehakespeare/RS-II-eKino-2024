using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class AddSpolToUser : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "SpolId",
                table: "Users",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Spols",
                columns: table => new
                {
                    SpolId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Spols", x => x.SpolId);
                });

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.InsertData(
                table: "Spols",
                columns: new[] { "SpolId", "IsDeleted", "Naziv" },
                values: new object[,]
                {
                    { 1, false, "Muski" },
                    { 2, false, "Zenski" }
                });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 2,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 3,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 4,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 5,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 6,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 7,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 8,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 9,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 10,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 11,
                column: "SpolId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 12,
                column: "SpolId",
                value: 1);

            migrationBuilder.CreateIndex(
                name: "IX_Users_SpolId",
                table: "Users",
                column: "SpolId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_Spols_SpolId",
                table: "Users",
                column: "SpolId",
                principalTable: "Spols",
                principalColumn: "SpolId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_Spols_SpolId",
                table: "Users");

            migrationBuilder.DropTable(
                name: "Spols");

            migrationBuilder.DropIndex(
                name: "IX_Users_SpolId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "SpolId",
                table: "Users");

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 9, 28, 0, 0, 0, 0, DateTimeKind.Local));
        }
    }
}
